.class final synthetic Lcom/vkontakte/android/data/Analytics$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/NewsEntry;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/NewsEntry;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/data/Analytics$$Lambda$2;->arg$1:Lcom/vkontakte/android/NewsEntry;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/NewsEntry;)Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/data/Analytics$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/data/Analytics$$Lambda$2;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    return-object v0
.end method


# virtual methods
.method public onBindView(Landroid/view/View;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/data/Analytics$$Lambda$2;->arg$1:Lcom/vkontakte/android/NewsEntry;

    invoke-static {v0, p1}, Lcom/vkontakte/android/data/Analytics;->lambda$getOnBindViewForNewsEntry$3(Lcom/vkontakte/android/NewsEntry;Landroid/view/View;)V

    return-void
.end method
