.class final synthetic Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

.field private final arg$2:Landroid/view/ViewGroup;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;Landroid/view/ViewGroup;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$$Lambda$1;->arg$2:Landroid/view/ViewGroup;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;Landroid/view/ViewGroup;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$$Lambda$1;-><init>(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;Landroid/view/ViewGroup;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$$Lambda$1;->arg$2:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->lambda$new$0(Landroid/view/ViewGroup;Landroid/view/View;)V

    return-void
.end method
