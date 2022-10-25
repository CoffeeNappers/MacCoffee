.class final Lcom/vk/music/view/SearchSuggestionContainer$LoadHintsCommand;
.super Ljava/lang/Object;
.source "SearchSuggestionContainer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/SearchSuggestionContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "LoadHintsCommand"
.end annotation


# instance fields
.field query:Ljava/lang/CharSequence;

.field final synthetic this$0:Lcom/vk/music/view/SearchSuggestionContainer;


# direct methods
.method constructor <init>(Lcom/vk/music/view/SearchSuggestionContainer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/view/SearchSuggestionContainer;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/vk/music/view/SearchSuggestionContainer$LoadHintsCommand;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method query(Ljava/lang/CharSequence;)Lcom/vk/music/view/SearchSuggestionContainer$LoadHintsCommand;
    .locals 0
    .param p1, "query"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 81
    iput-object p1, p0, Lcom/vk/music/view/SearchSuggestionContainer$LoadHintsCommand;->query:Ljava/lang/CharSequence;

    .line 82
    return-object p0
.end method

.method public run()V
    .locals 2

    .prologue
    .line 87
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer$LoadHintsCommand;->this$0:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v0, v0, Lcom/vk/music/view/SearchSuggestionContainer;->model:Lcom/vk/music/model/SearchSuggestionModel;

    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer$LoadHintsCommand;->query:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/music/model/SearchSuggestionModel;->loadHints(Ljava/lang/String;)V

    .line 88
    return-void
.end method
