# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Facerkutv2.Repo.insert!(%Facerkutv2.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Facerkutv2.Repo
alias Facerkutv2.User
alias Facerkutv2.Community
alias Facerkutv2.Topic

user = Repo.insert!(%User{
  name: "Renato Cassino",
  email: "renatocassino@gmail.com",
  photo_url: "https://graph.facebook.com/v2.6/10211109673045193/picture"})

community = Repo.insert!(%Community{
  title: "Estou Horrorizado e Curioso",
  slug: "estou-horrorizado-e-curioso",
  description: "Muito horrorizado mesmo",
  user: user})

Repo.insert!(%Topic{
  title: "Quao horrorizado alguem pode estar?",
  description: "Diante a essa situacao hipotetica",
  slug: "quao-horrorizado-alguem-pode-estar",
  community: community,
  user: user})
