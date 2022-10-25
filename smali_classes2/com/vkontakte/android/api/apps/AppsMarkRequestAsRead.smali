.class public Lcom/vkontakte/android/api/apps/AppsMarkRequestAsRead;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "AppsMarkRequestAsRead.java"


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 14
    .local p1, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const-string/jumbo v0, "apps.markRequestAsRead"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 15
    const-string/jumbo v0, "request_ids"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/apps/AppsMarkRequestAsRead;->params(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 16
    return-void
.end method
