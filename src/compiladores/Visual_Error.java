/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package compiladores;

/**
 *
 * @author Bochoa
 */
 class Visual_Error implements java.lang.Comparable{
	int line, column;
	String error ;
	Visual_Error(int l, int c, String e){
		line = l;
		column = c;
		error = e;
	}
        
          @Override
    public int compareTo(Object o) {
        Visual_Error comp = (Visual_Error) o;
        if (line == -1 ){
            return 1;
        }else{
            if (comp.line == -1){
                return -1;
            }
        }
        int result = 0 ;
        if (line < comp.line){
            result = -1;
        }else{
            if (line == comp.line){
                if(column < comp.column){
                    result = -1;
                }else{
                    if (column == comp.column)
                        result = 0;
                    else
                        result = 1;
                }
            }else{
                result = 1;
            }
        }
        return result;
    }
 }