.class final synthetic Lcom/vkontakte/android/fragments/ProfileFragment$4$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/ProfileFragment$4;

.field private final arg$2:Landroid/view/View;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment$4;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/ProfileFragment$4;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4$$Lambda$1;->arg$2:Landroid/view/View;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment$4;Landroid/view/View;)Landroid/widget/PopupMenu$OnMenuItemClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$4$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$4$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment$4;Landroid/view/View;)V

    return-object v0
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/ProfileFragment$4;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4$$Lambda$1;->arg$2:Landroid/view/View;

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$4;->lambda$onClick$0(Landroid/view/View;Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method
