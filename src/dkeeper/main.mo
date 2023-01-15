import Text "mo:base/Text";
import List "mo:base/List";
import Debug "mo:base/Debug";

actor Dkeeper {
    
    public type Note = {
      title : Text;
      content : Text;
    } ;

    var notes : List.List<Note> = List.nil<Note>();

public func createNote(titleText : Text , contentText : Text){
      
      let newNote : Note = {
        title = titleText;
        content = contentText;
      };

    notes := List.push(newNote ,notes);
    Debug.print(debug_show(notes))
};

public query func readNotes():  async [Note] { 
//Using list is performancewise is not efficient on the blockchain so we use array
    return List.toArray(notes)
};


}