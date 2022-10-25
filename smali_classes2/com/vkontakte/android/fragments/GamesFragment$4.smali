.class Lcom/vkontakte/android/fragments/GamesFragment$4;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "GamesFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/GamesFragment;->doLoadData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/GamesFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/GamesFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/GamesFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 181
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GamesFragment$4;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 217
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 218
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;)V
    .locals 8
    .param p1, "res"    # Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

    .prologue
    .line 184
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$4;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/GamesFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$4;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GamesFragment;->access$200(Lcom/vkontakte/android/fragments/GamesFragment;)Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$4;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/GamesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/GamesFragment$4;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/GamesFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "visitSource"

    const-string/jumbo v4, "direct"

    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, p1, v1, v2}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->access$400(Lcom/vkontakte/android/fragments/GamesFragment$Adapter;Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;Landroid/app/Activity;Ljava/lang/String;)V

    .line 188
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$4;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    new-instance v1, Lcom/vkontakte/android/fragments/GamesFragment$4$1;

    const v2, 0x7f08030c

    iget-object v3, p1, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->html5Catalog:Ljava/util/ArrayList;

    sget-object v4, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->html5:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    invoke-direct {v1, p0, v2, v3, v4}, Lcom/vkontakte/android/fragments/GamesFragment$4$1;-><init>(Lcom/vkontakte/android/fragments/GamesFragment$4;ILjava/util/ArrayList;Lcom/vkontakte/android/data/CatalogInfo$FilterType;)V

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/GamesFragment;->access$502(Lcom/vkontakte/android/fragments/GamesFragment;Lcom/vkontakte/android/api/apps/CatalogLoader;)Lcom/vkontakte/android/api/apps/CatalogLoader;

    .line 195
    iget-object v7, p0, Lcom/vkontakte/android/fragments/GamesFragment$4;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    new-instance v0, Lcom/vkontakte/android/fragments/GamesFragment$4$2;

    const v2, 0x7f08031a

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    iget-boolean v1, v1, Lcom/vkontakte/android/auth/VKAccount;->htmlGamesEnabled:Z

    if-eqz v1, :cond_1

    iget-object v3, p1, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->myCatalogHtml5:Ljava/util/ArrayList;

    :goto_0
    sget-object v4, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->installed:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    iget-boolean v1, v1, Lcom/vkontakte/android/auth/VKAccount;->htmlGamesEnabled:Z

    if-eqz v1, :cond_2

    const-string/jumbo v5, "html5"

    :goto_1
    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/fragments/GamesFragment$4$2;-><init>(Lcom/vkontakte/android/fragments/GamesFragment$4;ILjava/util/ArrayList;Lcom/vkontakte/android/data/CatalogInfo$FilterType;Ljava/lang/String;)V

    invoke-static {v7, v0}, Lcom/vkontakte/android/fragments/GamesFragment;->access$602(Lcom/vkontakte/android/fragments/GamesFragment;Lcom/vkontakte/android/api/apps/CatalogLoader;)Lcom/vkontakte/android/api/apps/CatalogLoader;

    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$4;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    new-instance v1, Lcom/vkontakte/android/fragments/GamesFragment$4$3;

    const v2, 0x7f08041a

    iget-object v3, p1, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->newCatalog:Ljava/util/ArrayList;

    sget-object v4, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->filterNew:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    invoke-direct {v1, p0, v2, v3, v4}, Lcom/vkontakte/android/fragments/GamesFragment$4$3;-><init>(Lcom/vkontakte/android/fragments/GamesFragment$4;ILjava/util/ArrayList;Lcom/vkontakte/android/data/CatalogInfo$FilterType;)V

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/GamesFragment;->access$702(Lcom/vkontakte/android/fragments/GamesFragment;Lcom/vkontakte/android/api/apps/CatalogLoader;)Lcom/vkontakte/android/api/apps/CatalogLoader;

    .line 207
    iget-object v0, p1, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->featuredCatalog:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/data/ApiApplication;

    .line 208
    .local v6, "app":Lcom/vkontakte/android/data/ApiApplication;
    new-instance v1, Lcom/vkontakte/android/data/CatalogInfo;

    const v2, 0x7f080256

    sget-object v3, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->featured:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/data/CatalogInfo;-><init>(ILcom/vkontakte/android/data/CatalogInfo$FilterType;)V

    iput-object v1, v6, Lcom/vkontakte/android/data/ApiApplication;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    goto :goto_2

    .line 195
    .end local v6    # "app":Lcom/vkontakte/android/data/ApiApplication;
    :cond_1
    iget-object v3, p1, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->myCatalog:Ljava/util/ArrayList;

    goto :goto_0

    :cond_2
    const-string/jumbo v5, "android"

    goto :goto_1

    .line 210
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$4;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GamesFragment;->access$200(Lcom/vkontakte/android/fragments/GamesFragment;)Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->build()V

    .line 211
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$4;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$4;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/GamesFragment;->access$200(Lcom/vkontakte/android/fragments/GamesFragment;)Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->data:Ljava/util/List;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/fragments/GamesFragment;->access$800(Lcom/vkontakte/android/fragments/GamesFragment;Ljava/util/List;Z)V

    .line 212
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$4;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GamesFragment;->access$900(Lcom/vkontakte/android/fragments/GamesFragment;)V

    .line 213
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 181
    check-cast p1, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/GamesFragment$4;->success(Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;)V

    return-void
.end method
