package com.example.CDLibrary.services;

import com.example.CDLibrary.model.CD;

public interface CdService {
    public Iterable<CD> findAll();

    public Iterable<CD> findByArtistOrderByArtistDesc(String name);
}
