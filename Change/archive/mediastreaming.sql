create table mediastream (
    msid bigserial primary key,
    title varchar(128) not null,
    url text not nulls,

    UNIQUE(title, url)
);
alter table mediastream owner to nics;

create table mediastream_workspace (
    id bigserial primary key,
    msid bigint not null references mediastream on delete cascade on update cascade,
    workspaceid int not null,

    constraint msw_ms_fkey foreign key (msid) references mediastream(msid),
    constraint msw_workspace_fkey foreign key (workspaceid) references workspace(workspaceid)
);
alter table mediastream_workspace owner to nics;
