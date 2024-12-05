(** Remove empty strings from the given list. *)
let remove_empty string = List.filter (fun s -> s <> "") string

(** Split an input into lines, removing empty lines. *)
let split_lines input = String.split_on_char '\n' input |> remove_empty
