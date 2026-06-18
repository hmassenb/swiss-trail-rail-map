create table if not exists public.community_routes (
  id text primary key,
  payload jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.community_routes enable row level security;

drop policy if exists "Public can read community routes" on public.community_routes;
create policy "Public can read community routes"
on public.community_routes
for select
using (true);

drop policy if exists "Public can upsert community routes" on public.community_routes;
create policy "Public can upsert community routes"
on public.community_routes
for insert
with check ((payload->>'visibility') is distinct from 'private');

drop policy if exists "Public can update non-private community routes" on public.community_routes;
create policy "Public can update non-private community routes"
on public.community_routes
for update
using ((payload->>'visibility') is distinct from 'private')
with check ((payload->>'visibility') is distinct from 'private');
