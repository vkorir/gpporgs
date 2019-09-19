package edu.berkeley.gpporgs.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.persistence.Id;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "sectors")
public class Sector {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private @NonNull String name;
}
