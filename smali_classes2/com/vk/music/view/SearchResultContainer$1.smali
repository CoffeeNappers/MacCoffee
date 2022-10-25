.class Lcom/vk/music/view/SearchResultContainer$1;
.super Ljava/lang/Object;
.source "SearchResultContainer.java"

# interfaces
.implements Lcom/vk/music/view/adapter/ItemViewHolder$Binder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/view/SearchResultContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/SearchResultModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vk/music/view/adapter/ItemViewHolder$Binder",
        "<",
        "Lcom/vkontakte/android/api/Group;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/SearchResultContainer;


# direct methods
.method constructor <init>(Lcom/vk/music/view/SearchResultContainer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/view/SearchResultContainer;

    .prologue
    .line 209
    iput-object p1, p0, Lcom/vk/music/view/SearchResultContainer$1;->this$0:Lcom/vk/music/view/SearchResultContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vkontakte/android/api/Group;I)V
    .locals 2
    .param p1, "refs"    # Lcom/vk/music/view/adapter/ViewRefs;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "group"    # Lcom/vkontakte/android/api/Group;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "position"    # I

    .prologue
    .line 220
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/music/view/CommunityImageView;

    iget-boolean v1, p2, Lcom/vkontakte/android/api/Group;->verified:Z

    invoke-virtual {v0, v1}, Lcom/vk/music/view/CommunityImageView;->setVerified(Z)V

    .line 221
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p2, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 222
    return-void
.end method

.method public bridge synthetic onBind(Lcom/vk/music/view/adapter/ViewRefs;Ljava/lang/Object;I)V
    .locals 0
    .param p1    # Lcom/vk/music/view/adapter/ViewRefs;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 209
    check-cast p2, Lcom/vkontakte/android/api/Group;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vk/music/view/SearchResultContainer$1;->onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vkontakte/android/api/Group;I)V

    return-void
.end method

.method public onCreate(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;
    .locals 2
    .param p1, "itemView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 213
    new-instance v0, Lcom/vk/music/view/adapter/ViewRefs;

    invoke-direct {v0}, Lcom/vk/music/view/adapter/ViewRefs;-><init>()V

    const v1, 0x7f1003c7

    .line 214
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    const v1, 0x7f1003c8

    .line 215
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    return-object v0
.end method
