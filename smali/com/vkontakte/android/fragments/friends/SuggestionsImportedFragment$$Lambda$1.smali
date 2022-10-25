.class final synthetic Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/data/Friends$GetImportedContactsCallback;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment;)Lcom/vkontakte/android/data/Friends$GetImportedContactsCallback;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment;)V

    return-object v0
.end method


# virtual methods
.method public onUsersLoaded(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment;->lambda$doLoadData$1(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    return-void
.end method
