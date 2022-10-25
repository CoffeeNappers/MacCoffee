.class final synthetic Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)V

    return-object v0
.end method


# virtual methods
.method public getSelectorBounds(Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->lambda$onViewCreated$0(Landroid/view/View;Landroid/graphics/Rect;)V

    return-void
.end method
