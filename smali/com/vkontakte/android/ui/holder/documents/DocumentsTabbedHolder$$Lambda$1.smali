.class final synthetic Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/ui/widget/SubPagerOfList$IScrollToPageView;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;

.field private final arg$2:Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;

    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$$Lambda$1;->arg$2:Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;)Lcom/vkontakte/android/ui/widget/SubPagerOfList$IScrollToPageView;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$$Lambda$1;-><init>(Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;)V

    return-object v0
.end method


# virtual methods
.method public scrollToPageView()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$$Lambda$1;->arg$2:Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;->lambda$onBind$0(Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;)V

    return-void
.end method
