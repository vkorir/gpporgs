package edu.berkeley.gpporgs.model;

import lombok.*;

import javax.persistence.*;

/**
 * @author Victor Korir
 */

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "languages")
public class Language {
    @Id
    private String code;
    private String name;
}
