.class final synthetic Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

.field private final arg$2:Landroid/app/Activity;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$$Lambda$3;->arg$1:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$$Lambda$3;->arg$2:Landroid/app/Activity;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;Landroid/app/Activity;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$$Lambda$3;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$$Lambda$3;-><init>(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;Landroid/app/Activity;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$$Lambda$3;->arg$1:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$$Lambda$3;->arg$2:Landroid/app/Activity;

    invoke-virtual {v0, v1, p1, p2}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->lambda$onOptionsItemSelected$0(Landroid/app/Activity;Landroid/content/DialogInterface;I)V

    return-void
.end method
