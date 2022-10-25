.class Lcom/vk/music/view/SearchSuggestionContainer$2;
.super Ljava/lang/Object;
.source "SearchSuggestionContainer.java"

# interfaces
.implements Lcom/vk/music/view/adapter/ItemViewHolder$Binder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/view/SearchSuggestionContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/SearchSuggestionModel;)V
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
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/SearchSuggestionContainer;


# direct methods
.method constructor <init>(Lcom/vk/music/view/SearchSuggestionContainer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/view/SearchSuggestionContainer;

    .prologue
    .line 180
    iput-object p1, p0, Lcom/vk/music/view/SearchSuggestionContainer$2;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
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
    .line 180
    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vk/music/view/SearchSuggestionContainer$2;->onBind(Lcom/vk/music/view/adapter/ViewRefs;Ljava/lang/String;I)V

    return-void
.end method

.method public onBind(Lcom/vk/music/view/adapter/ViewRefs;Ljava/lang/String;I)V
    .locals 1
    .param p1, "refs"    # Lcom/vk/music/view/adapter/ViewRefs;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "s"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "position"    # I

    .prologue
    .line 191
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 192
    return-void
.end method

.method public onCreate(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;
    .locals 3
    .param p1, "itemView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 184
    move-object v0, p1

    check-cast v0, Landroid/widget/TextView;

    .line 185
    .local v0, "text":Landroid/widget/TextView;
    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer$2;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchSuggestionContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    const v2, 0x7f0f008d

    invoke-virtual {v1, v2}, Lcom/vk/core/util/Resourcer;->color(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 186
    new-instance v1, Lcom/vk/music/view/adapter/ViewRefs;

    invoke-direct {v1}, Lcom/vk/music/view/adapter/ViewRefs;-><init>()V

    invoke-virtual {v1, v0}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v1

    return-object v1
.end method
