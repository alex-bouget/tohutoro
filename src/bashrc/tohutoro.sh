#!/bin/bash

function tohutoro {
    if [ -z "$1" ]; then
        echo "Usage: tohutoro <command>"
        echo "Try 'tohutoro help' for more information."
        return
    fi
    case "$1" in
        "help")
            echo "Usage: tohutoro <command>"
            echo "Commands:"
            echo "  help    Show this help message"
            echo "  version Show the version of tohutoro"
            echo "  update  Update tohutoro"
            echo "  edit    Edit a config file"
            ;;
        "version")
            echo "tohutoro version $(cat "$TOHUTORO_DIR/configs/version")"
            ;;
        "update")
            echo "Updating tohutoro..."
            echo "ERROR: Not implemented yet"
            ;;
        "edit")
            if [ -z "$2" ]; then
                echo "Usage: tohutoro edit <config>"
                echo "Try 'tohutoro edit help' for more information."
                return
            fi
            TOHUTORO_EDITOR=$(cat "$TOHUTORO_DIR/configs/editor")
            case "$2" in
                "help")
                    echo "Usage: tohutoro edit <config>"
                    echo "Configs:"
                    echo "  bashrc  Edit the bashrc file"
                    echo "  command Edit the commands file"
                    echo "  auto    Edit the autostart file"
                    echo "  use     Change the text editor"
                    ;;
                "bashrc")
                    $TOHUTORO_EDITOR "$TOHUTORO_DIR/bashrc/bashrc.sh"
                    ;;
                "command")
                    $TOHUTORO_EDITOR "$TOHUTORO_DIR/bashrc/command.sh"
                    ;;
                "auto")
                    $TOHUTORO_EDITOR "$TOHUTORO_DIR/autostart/autostart.data"
                    ;;
                "use")
                    if [ -z "$3" ]; then
                        echo "Usage: tohutoro edit use <editor>"
                        echo "Try 'tohutoro help' for more information."
                        return
                    fi
                    echo "$3" > "$TOHUTORO_DIR/configs/editor"
                    ;;

                *)
                    echo "Unknown config: $2"
                    echo "Try 'tohutoro edit help' for more information."
                    ;;
            esac
            ;;
        *)
            echo "Unknown command: $1"
            echo "Try 'tohutoro help' for more information."
            ;;
    esac
}