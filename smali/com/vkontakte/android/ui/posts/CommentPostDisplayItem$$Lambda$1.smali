.class final synthetic Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$$Lambda$1;-><init>(Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->lambda$onBindView$0(Landroid/view/View;)V

    return-void
.end method
