/*
 * e cada cuenta se conoce su CBU, alias, DNI del titular, moneda y 
 monto.
 */
package parcialtexto;

/**
 *
 * @author Usuario
 */
public class Cuenta {
    private int cbu;
    private String alias;
    private int dniTitular;
    private String moneda;
    private double monto;

    public Cuenta(int cbu, String alias, int dniTitular, String moneda) {
        this.cbu = cbu;
        this.alias = alias;
        this.dniTitular = dniTitular;
        this.moneda = moneda;
        this.monto = 0;
    }
    
    
    
}
