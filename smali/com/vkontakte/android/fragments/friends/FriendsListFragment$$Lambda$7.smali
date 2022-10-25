.class final synthetic Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$7;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/ui/util/AlphabetSegmenter$Converter;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$7;->arg$1:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/ui/util/AlphabetSegmenter$Converter;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$7;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$7;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V

    return-object v0
.end method


# virtual methods
.method public getIndex(Ljava/lang/Object;)C
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$7;->arg$1:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    check-cast p1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->lambda$updateData$3(Lcom/vkontakte/android/UserProfile;)C

    move-result v0

    return v0
.end method
