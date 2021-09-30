CREATE TABLE featurecomment (
    featurecommentid bigint NOT NULL,
    featureid bigint NOT NULL,
    comment character varying(2048) NOT NULL,
    datetime timestamp without time zone DEFAULT now() NOT NULL,
    username character varying(100) NOT NULL
);

--
-- Name: featurecomment_featurecommentid_seq; Type: SEQUENCE; Schema: public;
--

CREATE SEQUENCE featurecomment_featurecommentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: featurecomment_featurecommentid_seq; Type: SEQUENCE OWNED BY; Schema: public;
--

ALTER SEQUENCE featurecomment_featurecommentid_seq OWNED BY featurecomment.featurecommentid;

--
-- Name: featurecommentid; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY featurecomment ALTER COLUMN featurecommentid SET DEFAULT nextval('featurecomment_featurecommentid_seq'::regclass);

--
-- Name: featurecomment_pkey; Type: CONSTRAINT; Schema: public; Tablespace: 
--

ALTER TABLE ONLY featurecomment
    ADD CONSTRAINT featurecomment_pkey PRIMARY KEY (featurecommentid);

--
-- Name: fk_featurecomment_collabroomid; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY featurecomment
    ADD CONSTRAINT fk_featurecomment_featureid FOREIGN KEY (featureid) REFERENCES feature(featureid);


--
-- Name: fK_featurecomment_username; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY featurecomment
    ADD CONSTRAINT fk_featurecomment_username FOREIGN KEY (username) REFERENCES "user"(username);

ALTER TABLE featurecomment OWNER to nics;

ALTER TABLE feature ALTER COLUMN attributes TYPE varchar(2000);
