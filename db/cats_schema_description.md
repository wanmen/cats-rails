TABLE admin:
# no use

TABLE articles

TABLE books

TABLE comments

TABLE likes

TABLE links
# item(book,video,article) list relation

TABLE lists
      integer type: ["书单",1],["视频集",2],["经验贴集",3]

TABLE rates

TABLE taglinks

TABLE tags

TABLE users

TABLE videos
      integer ownership: type 2 means the copyright belongs to wanmen, type 1 otherwise.


