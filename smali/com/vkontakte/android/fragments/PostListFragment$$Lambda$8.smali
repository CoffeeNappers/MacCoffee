.class final synthetic Lcom/vkontakte/android/fragments/PostListFragment$$Lambda$8;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/PostListFragment;

.field private final arg$2:Lcom/vkontakte/android/NewsEntry;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/PostListFragment;Lcom/vkontakte/android/NewsEntry;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostListFragment$$Lambda$8;->arg$1:Lcom/vkontakte/android/fragments/PostListFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/PostListFragment$$Lambda$8;->arg$2:Lcom/vkontakte/android/NewsEntry;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/PostListFragment;Lcom/vkontakte/android/NewsEntry;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$$Lambda$8;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment$$Lambda$8;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Lcom/vkontakte/android/NewsEntry;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment$$Lambda$8;->arg$1:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$$Lambda$8;->arg$2:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v0, v1, p1, p2}, Lcom/vkontakte/android/fragments/PostListFragment;->lambda$showReportAdDialog$6(Lcom/vkontakte/android/NewsEntry;Landroid/content/DialogInterface;I)V

    return-void
.end method
