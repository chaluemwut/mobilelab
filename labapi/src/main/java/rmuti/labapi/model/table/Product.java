package rmuti.labapi.model.table;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.util.Date;

@ToString
@Data
@Entity(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "user_id")
    private int userId;

    @Column
    private String name;

    @Column
    private String description;

    @Column
    private int price;

    @Column(name = "create_date")
    private Date dateTime = new Date();

}
