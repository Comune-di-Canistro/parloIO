package it.comunecanistro.parlo_io.data_model.entities;

import lombok.*;

import javax.persistence.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
public class AdminUser {

    @Id
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "seq_admins"
    )
    @SequenceGenerator(
            name = "seq_admins",
            allocationSize = 1,
            initialValue = 2
    )
    private Integer id;

    @Column(unique = true)
    private String username;

    private String firstName;

    private String familyName;

    private String password;

    private String email;

    private String role;

    private Boolean enabled;

}
