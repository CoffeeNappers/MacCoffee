.class final synthetic Lcom/vkontakte/android/ui/SearchViewWrapper$3$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/SearchViewWrapper$3;

.field private final arg$2:Landroid/text/Editable;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/SearchViewWrapper$3;Landroid/text/Editable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3$$Lambda$3;->arg$1:Lcom/vkontakte/android/ui/SearchViewWrapper$3;

    iput-object p2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3$$Lambda$3;->arg$2:Landroid/text/Editable;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/SearchViewWrapper$3;Landroid/text/Editable;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/SearchViewWrapper$3$$Lambda$3;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper$3$$Lambda$3;-><init>(Lcom/vkontakte/android/ui/SearchViewWrapper$3;Landroid/text/Editable;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3$$Lambda$3;->arg$1:Lcom/vkontakte/android/ui/SearchViewWrapper$3;

    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3$$Lambda$3;->arg$2:Landroid/text/Editable;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->lambda$afterTextChanged$2(Landroid/text/Editable;)V

    return-void
.end method
