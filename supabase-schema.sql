create table if not exists public.quiz_submissions (
  id text primary key,
  quiz_id text not null,
  created_at timestamptz not null default now(),
  answers jsonb not null default '[]'::jsonb,
  result_profile text,
  result_title text
);

create table if not exists public.quiz_funnel (
  session_id text primary key,
  quiz_id text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  max_rank integer not null default 0,
  stage text not null default 'visit'
);

alter table public.quiz_submissions enable row level security;
alter table public.quiz_funnel enable row level security;

drop policy if exists "Allow public insert submissions" on public.quiz_submissions;
drop policy if exists "Allow public read submissions" on public.quiz_submissions;
drop policy if exists "Allow public delete submissions" on public.quiz_submissions;

create policy "Allow public insert submissions"
on public.quiz_submissions
for insert
to anon
with check (true);

create policy "Allow public read submissions"
on public.quiz_submissions
for select
to anon
using (true);

create policy "Allow public delete submissions"
on public.quiz_submissions
for delete
to anon
using (true);

drop policy if exists "Allow public upsert funnel" on public.quiz_funnel;
drop policy if exists "Allow public update funnel" on public.quiz_funnel;
drop policy if exists "Allow public read funnel" on public.quiz_funnel;
drop policy if exists "Allow public delete funnel" on public.quiz_funnel;

create policy "Allow public upsert funnel"
on public.quiz_funnel
for insert
to anon
with check (true);

create policy "Allow public update funnel"
on public.quiz_funnel
for update
to anon
using (true)
with check (true);

create policy "Allow public read funnel"
on public.quiz_funnel
for select
to anon
using (true);

create policy "Allow public delete funnel"
on public.quiz_funnel
for delete
to anon
using (true);
