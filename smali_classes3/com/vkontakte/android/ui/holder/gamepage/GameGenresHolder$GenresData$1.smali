.class Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData$1;
.super Lcom/vkontakte/android/api/apps/CatalogLoader;
.source "GameGenresHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData;->getAppsAdapter(Landroid/content/Context;Ljava/lang/String;)Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$AppsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData;Ljava/util/ArrayList;Lcom/vkontakte/android/data/CatalogInfo;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData;
    .param p3, "catalogInfo"    # Lcom/vkontakte/android/data/CatalogInfo;
    .param p4, "bypassHtmlGames"    # Z

    .prologue
    .line 49
    .local p2, "application":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData$1;->this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData;

    invoke-direct {p0, p2, p3, p4}, Lcom/vkontakte/android/api/apps/CatalogLoader;-><init>(Ljava/util/ArrayList;Lcom/vkontakte/android/data/CatalogInfo;Z)V

    return-void
.end method


# virtual methods
.method public onLoadedNextPage(Ljava/util/ArrayList;Z)V
    .locals 2
    .param p2, "canLoadMore"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p1, "allData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData$1;->this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData;->appsAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$AppsAdapter;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData$1;->this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData;

    iput-object p1, v1, Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData;->apiApplications:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$AppsAdapter;->setData(Ljava/util/ArrayList;Z)V

    .line 53
    return-void
.end method
