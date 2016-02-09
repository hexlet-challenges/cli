let hexlet_dir = Filename.concat (Unix.getenv "HOME") "hexlet-challenges";;

let init =
  if not (Sys.file_exists hexlet_dir) then begin
    Printf.printf "'%s' has been created\n" hexlet_dir;
    Unix.mkdir hexlet_dir 0o755
  end else
    Printf.printf "'%s' already exists\n" hexlet_dir
;;

(*raise (Failure argument)*)
let action argument = match argument with
  "init" -> init
  | _ -> failwith "Unknown command"
;;

let usage = "usage: " ^ Sys.argv.(0) ^ " <course's slug>"
let speclist = [
  (*"init", Arg.Symbol (init), ": some int parameter"*)
]

let () =
  (* Read the arguments *)
  Arg.parse
    speclist
    (fun x -> (action x))
    usage;
;;
