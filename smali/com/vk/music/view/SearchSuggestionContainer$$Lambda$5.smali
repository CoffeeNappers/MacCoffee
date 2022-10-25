.class final synthetic Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$5;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/VoidF;


# instance fields
.field private final arg$1:Lcom/vk/music/view/SearchSuggestionContainer;

.field private final arg$2:Lcom/vk/music/model/SearchSuggestionModel;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/SearchSuggestionContainer;Lcom/vk/music/model/SearchSuggestionModel;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$5;->arg$1:Lcom/vk/music/view/SearchSuggestionContainer;

    iput-object p2, p0, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$5;->arg$2:Lcom/vk/music/model/SearchSuggestionModel;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/view/SearchSuggestionContainer;Lcom/vk/music/model/SearchSuggestionModel;)Lcom/vkontakte/android/functions/VoidF;
    .locals 1

    new-instance v0, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$5;

    invoke-direct {v0, p0, p1}, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$5;-><init>(Lcom/vk/music/view/SearchSuggestionContainer;Lcom/vk/music/model/SearchSuggestionModel;)V

    return-object v0
.end method


# virtual methods
.method public f()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$5;->arg$1:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$5;->arg$2:Lcom/vk/music/model/SearchSuggestionModel;

    invoke-virtual {v0, v1}, Lcom/vk/music/view/SearchSuggestionContainer;->lambda$new$5(Lcom/vk/music/model/SearchSuggestionModel;)V

    return-void
.end method
