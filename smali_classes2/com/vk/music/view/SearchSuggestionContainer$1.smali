.class Lcom/vk/music/view/SearchSuggestionContainer$1;
.super Ljava/lang/Object;
.source "SearchSuggestionContainer.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/view/SearchSuggestionContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/SearchSuggestionModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/SearchSuggestionContainer;


# direct methods
.method constructor <init>(Lcom/vk/music/view/SearchSuggestionContainer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/view/SearchSuggestionContainer;

    .prologue
    .line 153
    iput-object p1, p0, Lcom/vk/music/view/SearchSuggestionContainer$1;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 4
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 162
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer$1;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer$1;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchSuggestionContainer;->loadHintsCommand:Lcom/vk/music/view/SearchSuggestionContainer$LoadHintsCommand;

    invoke-virtual {v0, v1}, Lcom/vk/music/view/SearchSuggestionContainer;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 163
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 164
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer$1;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v0, v0, Lcom/vk/music/view/SearchSuggestionContainer;->hintsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 165
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer$1;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer$1;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchSuggestionContainer;->emptyAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v0, v1}, Lcom/vk/music/view/SearchSuggestionContainer;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 170
    :goto_0
    return-void

    .line 167
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer$1;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer$1;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchSuggestionContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v0, v1}, Lcom/vk/music/view/SearchSuggestionContainer;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 168
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer$1;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer$1;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchSuggestionContainer;->loadHintsCommand:Lcom/vk/music/view/SearchSuggestionContainer$LoadHintsCommand;

    invoke-virtual {v1, p1}, Lcom/vk/music/view/SearchSuggestionContainer$LoadHintsCommand;->query(Ljava/lang/CharSequence;)Lcom/vk/music/view/SearchSuggestionContainer$LoadHintsCommand;

    move-result-object v1

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/music/view/SearchSuggestionContainer;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 155
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 158
    return-void
.end method
