.class final synthetic Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$8;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/widget/MenuListView;

.field private final arg$2:Ljava/lang/CharSequence;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/widget/MenuListView;Ljava/lang/CharSequence;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$8;->arg$1:Lcom/vkontakte/android/ui/widget/MenuListView;

    iput-object p2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$8;->arg$2:Ljava/lang/CharSequence;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/widget/MenuListView;Ljava/lang/CharSequence;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$8;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$8;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;Ljava/lang/CharSequence;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$8;->arg$1:Lcom/vkontakte/android/ui/widget/MenuListView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$8;->arg$2:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->lambda$null$3(Ljava/lang/CharSequence;)V

    return-void
.end method
