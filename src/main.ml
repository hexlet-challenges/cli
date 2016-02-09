open Actions

let hexlet_dir = Filename.concat (Unix.getenv "HOME") "hexlet-challenges";;
let course_name = ref "";;

(*raise (Failure argument)*)
let action argument = match argument with
  | "init" -> init hexlet_dir
  | "fetch" -> fetch course_name
  | _ -> failwith "Unknown command"
;;

let usage = "usage: " ^ Sys.argv.(0) ^ " <course's slug>"
let speclist = [
  "-c", Arg.Set_string (course_name), ": some int parameter"
]

let () =
  (* Read the arguments *)
  Arg.parse
    speclist
    (fun x -> (action x))
    usage;
;;
