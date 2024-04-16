package org.fullstack4.springmvc.sample;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
@Qualifier("event")
public class SampleEventImpl implements SampleDAO{

}
