.class final synthetic Lcom/vkontakte/android/fragments/friends/FriendsFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/friends/FriendsFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)V

    return-object v0
.end method


# virtual methods
.method public onViewExpansionStateChanged(Z)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->lambda$onViewCreated$1(Z)V

    return-void
.end method
