.class final synthetic Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

.field private final arg$2:Landroid/view/View;

.field private final arg$3:Lcom/vkontakte/android/functions/F0;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Landroid/view/View;Lcom/vkontakte/android/functions/F0;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$$Lambda$3;->arg$1:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$$Lambda$3;->arg$2:Landroid/view/View;

    iput-object p3, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$$Lambda$3;->arg$3:Lcom/vkontakte/android/functions/F0;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Landroid/view/View;Lcom/vkontakte/android/functions/F0;)Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$$Lambda$3;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$$Lambda$3;-><init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Landroid/view/View;Lcom/vkontakte/android/functions/F0;)V

    return-object v0
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$$Lambda$3;->arg$1:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$$Lambda$3;->arg$2:Landroid/view/View;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$$Lambda$3;->arg$3:Lcom/vkontakte/android/functions/F0;

    invoke-virtual {v0, v1, v2, p1}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->lambda$showUnSubscribeMenu$2(Landroid/view/View;Lcom/vkontakte/android/functions/F0;Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method
