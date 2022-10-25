.class final synthetic Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$6;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$6;->arg$1:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/Comparator;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$6;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$6;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V

    return-object v0
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$6;->arg$1:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    check-cast p1, Lcom/vkontakte/android/UserProfile;

    check-cast p2, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->lambda$updateData$2(Lcom/vkontakte/android/UserProfile;Lcom/vkontakte/android/UserProfile;)I

    move-result v0

    return v0
.end method
