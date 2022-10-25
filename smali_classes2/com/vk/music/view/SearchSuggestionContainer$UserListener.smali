.class final Lcom/vk/music/view/SearchSuggestionContainer$UserListener;
.super Lcom/vk/core/widget/LifecycleListener;
.source "SearchSuggestionContainer.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/SearchSuggestionContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "UserListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/SearchSuggestionContainer;


# direct methods
.method constructor <init>(Lcom/vk/music/view/SearchSuggestionContainer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/view/SearchSuggestionContainer;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    invoke-direct {p0}, Lcom/vk/core/widget/LifecycleListener;-><init>()V

    return-void
.end method

.method private requestSearch(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 138
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v0, v0, Lcom/vk/music/view/SearchSuggestionContainer;->model:Lcom/vk/music/model/SearchSuggestionModel;

    invoke-interface {v0, p1}, Lcom/vk/music/model/SearchSuggestionModel;->addRecent(Ljava/lang/String;)V

    .line 139
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v0, v0, Lcom/vk/music/view/SearchSuggestionContainer;->listener:Lcom/vk/music/view/SearchSuggestionContainer$Listener;

    if-eqz v0, :cond_0

    .line 140
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v0, v0, Lcom/vk/music/view/SearchSuggestionContainer;->listener:Lcom/vk/music/view/SearchSuggestionContainer$Listener;

    invoke-interface {v0}, Lcom/vk/music/view/SearchSuggestionContainer$Listener;->onSearchRequested()V

    .line 142
    :cond_0
    return-void
.end method


# virtual methods
.method public onClearRecentsClick()V
    .locals 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v0, v0, Lcom/vk/music/view/SearchSuggestionContainer;->model:Lcom/vk/music/model/SearchSuggestionModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchSuggestionModel;->clearRecents()V

    .line 120
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v0, v0, Lcom/vk/music/view/SearchSuggestionContainer;->recentsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 121
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v0, v0, Lcom/vk/music/view/SearchSuggestionContainer;->recentsCaptionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 122
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 126
    return-void
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 130
    const/4 v0, 0x3

    if-ne p2, v0, :cond_0

    .line 131
    invoke-virtual {p0}, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->onSearchClick()V

    .line 132
    const/4 v0, 0x1

    .line 134
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onHintClick(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 114
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/vk/music/view/SearchSuggestionContainer;->access$100(Lcom/vk/music/view/SearchSuggestionContainer;Ljava/lang/String;Z)V

    .line 115
    invoke-direct {p0, p1}, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->requestSearch(Ljava/lang/String;)V

    .line 116
    return-void
.end method

.method public onRecentOrPopularClick(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 109
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/vk/music/view/SearchSuggestionContainer;->access$100(Lcom/vk/music/view/SearchSuggestionContainer;Ljava/lang/String;Z)V

    .line 110
    invoke-direct {p0, p1}, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->requestSearch(Ljava/lang/String;)V

    .line 111
    return-void
.end method

.method public onSearchClick()V
    .locals 2

    .prologue
    .line 102
    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    invoke-static {v1}, Lcom/vk/music/view/SearchSuggestionContainer;->access$000(Lcom/vk/music/view/SearchSuggestionContainer;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 103
    .local v0, "text":Ljava/lang/CharSequence;
    if-eqz v0, :cond_0

    invoke-static {v0}, Landroid/text/TextUtils;->isGraphic(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 104
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->requestSearch(Ljava/lang/String;)V

    .line 106
    :cond_0
    return-void
.end method
