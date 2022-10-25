.class final synthetic Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$6;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/widget/MenuListView;

.field private final arg$2:Ljava/util/List;

.field private final arg$3:Ljava/util/List;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/widget/MenuListView;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$6;->arg$1:Lcom/vkontakte/android/ui/widget/MenuListView;

    iput-object p2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$6;->arg$2:Ljava/util/List;

    iput-object p3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$6;->arg$3:Ljava/util/List;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/widget/MenuListView;Ljava/util/List;Ljava/util/List;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$6;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$6;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$6;->arg$1:Lcom/vkontakte/android/ui/widget/MenuListView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$6;->arg$2:Ljava/util/List;

    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$6;->arg$3:Ljava/util/List;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->lambda$update$6(Ljava/util/List;Ljava/util/List;)V

    return-void
.end method
