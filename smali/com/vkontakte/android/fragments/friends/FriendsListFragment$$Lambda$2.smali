.class final synthetic Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/VoidF2Int;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF2Int;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V

    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    check-cast p1, Lcom/vkontakte/android/RequestUserProfile;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, p1, v1, p3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->accept(Lcom/vkontakte/android/RequestUserProfile;ZI)V

    return-void
.end method
