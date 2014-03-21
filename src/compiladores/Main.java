/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package compiladores;

/**
 *
 * @author owner
 */
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws FileNotFoundException, Exception {
     VisualForm f =  new VisualForm();
      
  
         jflex.Main.generate(new File("src\\compiladores\\Visual.flex"));
           
         
        String opciones[] = new String[5];
        //Seleccionamos la opción de dirección de destino
        opciones[0] = "-destdir";
        //Le damos la dirección
        opciones[1] = "src\\compiladores\\";
        //Seleccionamos la opción de nombre de archivo
        opciones[2] = "-parser";
        //Le damos el nombre que queremos que tenga
        opciones[3] = "Analizador";
        //Le decimos donde se encuentra el archivo .cup
        opciones[4] = "src\\compiladores\\Visual.cup";
        try {
            java_cup.Main.main(opciones);
        } catch (Exception e) {
            System.out.print(e);
        }
    
    f.setVisible(true);
    }
}  
    /*
       jflex.Main.generate(new File("src\\compiladores\\Visual.flex"));

        String opciones[] = new String[5];
        //Seleccionamos la opción de dirección de destino
        opciones[0] = "-destdir";
        //Le damos la dirección
        opciones[1] = "src\\compiladores\\";
        //Seleccionamos la opción de nombre de archivo
        opciones[2] = "-parser";
        //Le damos el nombre que queremos que tenga
        opciones[3] = "Analizador";
        //Le decimos donde se encuentra el archivo .cup
        opciones[4] = "src\\compiladores\\Visual.cup";
        try {
            java_cup.Main.main(opciones);
        } catch (Exception e) {
            System.out.print(e);
        }
        
        
        
        
        
        FileReader hola = new FileReader("src\\p.vb");
        lexer h= new lexer(hola);
        Analizador o = new Analizador(h);
        o.parse();
      */
    
        
     
        
        
        
         
        
        

    

