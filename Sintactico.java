
//----------------------------------------------------
// The following code was generated by CUP v0.11a beta 20060608
// Fri Feb 28 14:41:42 CST 2014
//----------------------------------------------------

import java_cup.runtime.*;
import javax.swing.tree.TreeNode;

/** CUP v0.11a beta 20060608 generated parser.
  * @version Fri Feb 28 14:41:42 CST 2014
  */
public class Sintactico extends java_cup.runtime.lr_parser {

  /** Default constructor. */
  public Sintactico() {super();}

  /** Constructor which sets the default scanner. */
  public Sintactico(java_cup.runtime.Scanner s) {super(s);}

  /** Constructor which sets the default scanner. */
  public Sintactico(java_cup.runtime.Scanner s, java_cup.runtime.SymbolFactory sf) {super(s,sf);}

  /** Production table. */
  protected static final short _production_table[][] = 
    unpackFromStrings(new String[] {
    "\000\002\000\002\002\003\000\002\002\004" });

  /** Access to production table. */
  public short[][] production_table() {return _production_table;}

  /** Parse-action table. */
  protected static final short[][] _action_table = 
    unpackFromStrings(new String[] {
    "\000\004\000\004\004\004\001\002\000\004\002\001\001" +
    "\002\000\004\002\006\001\002\000\004\002\000\001\002" +
    "" });

  /** Access to parse-action table. */
  public short[][] action_table() {return _action_table;}

  /** <code>reduce_goto</code> table. */
  protected static final short[][] _reduce_table = 
    unpackFromStrings(new String[] {
    "\000\004\000\004\002\004\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001" });

  /** Access to <code>reduce_goto</code> table. */
  public short[][] reduce_table() {return _reduce_table;}

  /** Instance of action encapsulation class. */
  protected CUP$Sintactico$actions action_obj;

  /** Action encapsulation object initializer. */
  protected void init_actions()
    {
      action_obj = new CUP$Sintactico$actions(this);
    }

  /** Invoke a user supplied parse action. */
  public java_cup.runtime.Symbol do_action(
    int                        act_num,
    java_cup.runtime.lr_parser parser,
    java.util.Stack            stack,
    int                        top)
    throws java.lang.Exception
  {
    /* call code in generated class */
    return action_obj.CUP$Sintactico$do_action(act_num, parser, stack, top);
  }

  /** Indicates start state. */
  public int start_state() {return 0;}
  /** Indicates start production. */
  public int start_production() {return 1;}

  /** <code>EOF</code> Symbol index. */
  public int EOF_sym() {return 0;}

  /** <code>error</code> Symbol index. */
  public int error_sym() {return 1;}




	public void syntax_error(Symbol cur_token) {
        report_error("Sytax error at line " + (cur_token.left+1) +
            ", column " + cur_token.right, null);
    }

    public void initSymbolTable(int size) {
        symtab = new SymbolTable(size);
    }

    public SymbolTable getSymbolTable() {
        return symtab;
    }

    public SymbolTable symtab;
    public FunctionEntry entry;
    public final int PROC_SYMTAB_SIZE = 25;

    public void enterVars(TreeNodeList vars, TreeNode type) {
        TreeNode node;
        TreeNodeList rest;
        boolean done  = false;
        for (node = vars.node, rest = vars.siblings; !done; ) {
            symtab.enter(new VariableEntry(
                (String) (((LeafNode) node).value), type, false, 0));
            if (rest == null) {
                done = true;
            }
            else {
                node = rest.node;
                rest = rest.siblings;
            }
        }
    }

    public void enterFormals(TreeNodeList formals) {
        TreeNode2 node;
        TreeNodeList rest;
        boolean done  = false;
        if (formals == null) return;
        for (node = (TreeNode2)formals.node, rest = formals.siblings; !done; ) {
            symtab.enter(new VariableEntry(
                (String) (((LeafNode) node.child1).value), node.child2,
                false, 0));
            if (rest == null) {
                done = true;
            }
            else {
                node = (TreeNode2) rest.node;
                rest = rest.siblings;
            }
        }
    }




}

/** Cup generated class to encapsulate user supplied action code.*/
class CUP$Sintactico$actions {
  private final Sintactico parser;

  /** Constructor */
  CUP$Sintactico$actions(Sintactico parser) {
    this.parser = parser;
  }

  /** Method with the actual generated action code. */
  public final java_cup.runtime.Symbol CUP$Sintactico$do_action(
    int                        CUP$Sintactico$act_num,
    java_cup.runtime.lr_parser CUP$Sintactico$parser,
    java.util.Stack            CUP$Sintactico$stack,
    int                        CUP$Sintactico$top)
    throws java.lang.Exception
    {
      /* Symbol object for return from actions */
      java_cup.runtime.Symbol CUP$Sintactico$result;

      /* select the action based on the action number */
      switch (CUP$Sintactico$act_num)
        {
          /*. . . . . . . . . . . . . . . . . . . .*/
          case 1: // $START ::= S EOF 
            {
              Object RESULT =null;
		int start_valleft = ((java_cup.runtime.Symbol)CUP$Sintactico$stack.elementAt(CUP$Sintactico$top-1)).left;
		int start_valright = ((java_cup.runtime.Symbol)CUP$Sintactico$stack.elementAt(CUP$Sintactico$top-1)).right;
		TreeNode start_val = (TreeNode)((java_cup.runtime.Symbol) CUP$Sintactico$stack.elementAt(CUP$Sintactico$top-1)).value;
		RESULT = start_val;
              CUP$Sintactico$result = parser.getSymbolFactory().newSymbol("$START",0, ((java_cup.runtime.Symbol)CUP$Sintactico$stack.elementAt(CUP$Sintactico$top-1)), ((java_cup.runtime.Symbol)CUP$Sintactico$stack.peek()), RESULT);
            }
          /* ACCEPT */
          CUP$Sintactico$parser.done_parsing();
          return CUP$Sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 0: // S ::= Dim 
            {
              TreeNode RESULT =null;
		 RESULT = new TreeNode(sym.Dim); 
              CUP$Sintactico$result = parser.getSymbolFactory().newSymbol("S",0, ((java_cup.runtime.Symbol)CUP$Sintactico$stack.peek()), ((java_cup.runtime.Symbol)CUP$Sintactico$stack.peek()), RESULT);
            }
          return CUP$Sintactico$result;

          /* . . . . . .*/
          default:
            throw new Exception(
               "Invalid action number found in internal parse table");

        }
    }
}

