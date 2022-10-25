.class final synthetic Lcom/vkontakte/android/ui/SearchViewWrapper$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnKeyListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/SearchViewWrapper;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/SearchViewWrapper;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$$Lambda$3;->arg$1:Lcom/vkontakte/android/ui/SearchViewWrapper;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/view/View$OnKeyListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/SearchViewWrapper$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/SearchViewWrapper$$Lambda$3;-><init>(Lcom/vkontakte/android/ui/SearchViewWrapper;)V

    return-object v0
.end method


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$$Lambda$3;->arg$1:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/ui/SearchViewWrapper;->lambda$new$2(Landroid/view/View;ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method
