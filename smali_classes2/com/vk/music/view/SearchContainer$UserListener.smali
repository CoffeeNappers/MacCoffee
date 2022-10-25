.class final Lcom/vk/music/view/SearchContainer$UserListener;
.super Lcom/vk/core/widget/LifecycleListener;
.source "SearchContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/SearchContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "UserListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/SearchContainer;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/SearchContainer;)V
    .locals 0

    .prologue
    .line 133
    iput-object p1, p0, Lcom/vk/music/view/SearchContainer$UserListener;->this$0:Lcom/vk/music/view/SearchContainer;

    invoke-direct {p0}, Lcom/vk/core/widget/LifecycleListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/music/view/SearchContainer;Lcom/vk/music/view/SearchContainer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/music/view/SearchContainer;
    .param p2, "x1"    # Lcom/vk/music/view/SearchContainer$1;

    .prologue
    .line 133
    invoke-direct {p0, p1}, Lcom/vk/music/view/SearchContainer$UserListener;-><init>(Lcom/vk/music/view/SearchContainer;)V

    return-void
.end method


# virtual methods
.method public onActivityResult(Ljava/lang/String;IILandroid/content/Intent;)V
    .locals 3
    .param p1, "instanceId"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "requestCode"    # I
    .param p3, "resultCode"    # I
    .param p4, "data"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 136
    invoke-super {p0, p1, p2, p3, p4}, Lcom/vk/core/widget/LifecycleListener;->onActivityResult(Ljava/lang/String;IILandroid/content/Intent;)V

    .line 137
    const/4 v1, -0x1

    if-eq p3, v1, :cond_1

    .line 166
    :cond_0
    :goto_0
    return-void

    .line 141
    :cond_1
    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 143
    :pswitch_0
    if-eqz p4, :cond_0

    .line 147
    const-string/jumbo v1, "query"

    invoke-virtual {p4, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 148
    .local v0, "query":Ljava/lang/String;
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer$UserListener;->this$0:Lcom/vk/music/view/SearchContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchContainer;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 149
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer$UserListener;->this$0:Lcom/vk/music/view/SearchContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchContainer;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V

    goto :goto_0

    .line 152
    .end local v0    # "query":Ljava/lang/String;
    :pswitch_1
    if-eqz p4, :cond_0

    .line 156
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer$UserListener;->this$0:Lcom/vk/music/view/SearchContainer;

    iget-object v2, v1, Lcom/vk/music/view/SearchContainer;->searchByTitleContainer:Lcom/vk/music/view/SearchResultContainer;

    const-string/jumbo v1, "result"

    invoke-virtual {p4, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vk/music/dto/Playlist;

    invoke-virtual {v2, v1}, Lcom/vk/music/view/SearchResultContainer;->onPlaylistResult(Lcom/vk/music/dto/Playlist;)V

    goto :goto_0

    .line 159
    :pswitch_2
    if-eqz p4, :cond_0

    .line 163
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer$UserListener;->this$0:Lcom/vk/music/view/SearchContainer;

    iget-object v2, v1, Lcom/vk/music/view/SearchContainer;->searchByArtistContainer:Lcom/vk/music/view/SearchResultContainer;

    const-string/jumbo v1, "result"

    invoke-virtual {p4, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vk/music/dto/Playlist;

    invoke-virtual {v2, v1}, Lcom/vk/music/view/SearchResultContainer;->onPlaylistResult(Lcom/vk/music/dto/Playlist;)V

    goto :goto_0

    .line 141
    nop

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 170
    invoke-super {p0, p1}, Lcom/vk/core/widget/LifecycleListener;->onActivityStopped(Landroid/app/Activity;)V

    .line 171
    iget-object v0, p0, Lcom/vk/music/view/SearchContainer$UserListener;->this$0:Lcom/vk/music/view/SearchContainer;

    iget-object v0, v0, Lcom/vk/music/view/SearchContainer;->model:Lcom/vk/music/model/SearchModel;

    iget-object v1, p0, Lcom/vk/music/view/SearchContainer$UserListener;->this$0:Lcom/vk/music/view/SearchContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchContainer;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/SearchModel;->setQuery(Ljava/lang/String;)V

    .line 172
    return-void
.end method
