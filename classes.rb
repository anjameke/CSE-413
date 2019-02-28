# Andrew Lee
# 1436724

class Document

    # Creates an empty Document (whose contents are an empty string)
    # and records that it was modified at the time the method was called
    def initialize
        @contents = ""
        @history = []
        @time = Time.now
    end

    # Sets the Document’s contents to be equal to new_contents.
    def contents=(new_contents)
        @contents = new_contents
        @history.insert(0, new_contents)
        @time = Time.now
    end

    # Returns the Document’s contents as a string.
    def contents
        @contents
    end

    # Returns a Ruby Time object representing the last time this
    # Document was modified. Actions that modify the Document are
    # creating it, settings its contents, or undoing.
    def modified
        @time
    end

    # Returns the size of the Document, which is equal to the number of
    # characters in its contents.
    def size
        @contents.length
    end

    def undo (n=1)
        if @history.length < n
            nil
        else
            @contents = @history[n].equal?(nil) ? "" : @history[n]
            @history.slice!(0..n-1)
            @time = Time.now
        end
    end
end

class Directory

    def initialize
        @children = {}
    end

    def store (name, child)
        @children[name] = child
    end

    def get (name)
        @children[name]
    end

    def delete (name)
        @children.key?(name) ? @children.delete(name) : nil
        # if @children.key?(name)
        #     @children.delete(name)
        # else
        #     nil
        # end
    end

    def size
        get_recur_children_size(@children)
    end
    
    def undo (n)
        undo_deep_hash(@children)
    end

    def get_by_path(file_path)
        find_file_path(file_path.split('/'))
    end
    
    protected
    def find_file_path(file_path_components)
        #    obj = get(file_path_components[0])
            if file_path_components.length == 1
                if @children[file_path_components[0]].is_a?(Directory)
                    nil
                else
                    @children[file_path_components[0]]
                end
            else
                if @children[file_path_components[0]].is_a?(Directory)
                    @children[file_path_components[0]].find_file_path(file_path_components.drop(1))
                else
                    nil
                end
            end
        end

    def get_recur_children_size (map, len=0)
        map.each do |name, doc|
            len += doc.size 
        end
        len
    end

    def undo_deep_hash (map)
        map.each do |name, doc|
             doc.undo(n)
            end
        end
    end