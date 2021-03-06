CREATE TABLE SPEAKER
(
  ID   BIGINT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  NAME VARCHAR(200),
  CONSTRAINT PK_SPEAKER PRIMARY KEY (ID),
  PHONE VARCHAR(200),
  EMAIL VARCHAR(200)
);

CREATE TABLE WEBSITE
(
  SPEAKER     BIGINT,
  SPEAKER_KEY VARCHAR(20),
  LINK        VARCHAR(200),
  TITLE       VARCHAR(200),
  CONSTRAINT PK_WEBSITE PRIMARY KEY (SPEAKER, SPEAKER_KEY)
);

CREATE TABLE TALK
(
  ID          BIGINT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  TITLE       VARCHAR(200),
  SPEAKER_IDS BIGINT ARRAY,
  CONSTRAINT PK_TALK PRIMARY KEY (ID)
);

CREATE TABLE CONFERENCE
(
  ID         BIGINT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  NAME       VARCHAR(200),
  START_DATE DATE,
  CONSTRAINT PK_CONFERENCE PRIMARY KEY (ID)
);

CREATE TABLE CONFERENCE_TALK
(
  CONFERENCE BIGINT,
  TALK       BIGINT,
  PRIMARY KEY (CONFERENCE, TALK)
);

ALTER TABLE CONFERENCE_TALK
  ADD CONSTRAINT FK_CONFERENCE_TALK_CONFERENCE FOREIGN KEY (CONFERENCE) REFERENCES CONFERENCE (ID);
ALTER TABLE CONFERENCE_TALK
  ADD CONSTRAINT FK_CONFERENCE_TALK_TALK FOREIGN KEY (TALK) REFERENCES TALK (ID);

CREATE TABLE UUID_ENTITY
(
  ID   UUID PRIMARY KEY,
  NAME VARCHAR(200)
);