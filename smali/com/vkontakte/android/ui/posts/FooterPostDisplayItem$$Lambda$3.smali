.class final synthetic Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$$Lambda$3;->arg$1:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$$Lambda$3;-><init>(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$$Lambda$3;->arg$1:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->lambda$new$2(Landroid/view/View;)V

    return-void
.end method
