.class final synthetic Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/ui/PhotoStripView$OnPhotoClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;)Lcom/vkontakte/android/ui/PhotoStripView$OnPhotoClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder$$Lambda$1;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;)V

    return-object v0
.end method


# virtual methods
.method public onPhotoClick(Lcom/vkontakte/android/ui/PhotoStripView;I)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->lambda$new$0(Lcom/vkontakte/android/ui/PhotoStripView;I)V

    return-void
.end method
