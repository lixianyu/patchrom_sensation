.class Landroid/view/ViewGroup$3;
.super Ljava/lang/Object;
.source "ViewGroup.java"

# interfaces
.implements Landroid/animation/LayoutTransition$TransitionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/view/ViewGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Landroid/view/ViewGroup;)V
    .locals 0
    .parameter

    .prologue
    .line 4921
    iput-object p1, p0, Landroid/view/ViewGroup$3;->this$0:Landroid/view/ViewGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public endTransition(Landroid/animation/LayoutTransition;Landroid/view/ViewGroup;Landroid/view/View;I)V
    .locals 2
    .parameter "transition"
    .parameter "container"
    .parameter "view"
    .parameter "transitionType"

    .prologue
    .line 4935
    iget-object v0, p0, Landroid/view/ViewGroup$3;->this$0:Landroid/view/ViewGroup;

    #getter for: Landroid/view/ViewGroup;->mLayoutSuppressed:Z
    invoke-static {v0}, Landroid/view/ViewGroup;->access$300(Landroid/view/ViewGroup;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/animation/LayoutTransition;->isChangingLayout()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4936
    iget-object v0, p0, Landroid/view/ViewGroup$3;->this$0:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 4937
    iget-object v0, p0, Landroid/view/ViewGroup$3;->this$0:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    #setter for: Landroid/view/ViewGroup;->mLayoutSuppressed:Z
    invoke-static {v0, v1}, Landroid/view/ViewGroup;->access$302(Landroid/view/ViewGroup;Z)Z

    .line 4939
    :cond_0
    const/4 v0, 0x3

    if-ne p4, v0, :cond_1

    iget-object v0, p0, Landroid/view/ViewGroup$3;->this$0:Landroid/view/ViewGroup;

    #getter for: Landroid/view/ViewGroup;->mTransitioningViews:Ljava/util/ArrayList;
    invoke-static {v0}, Landroid/view/ViewGroup;->access$400(Landroid/view/ViewGroup;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 4940
    iget-object v0, p0, Landroid/view/ViewGroup$3;->this$0:Landroid/view/ViewGroup;

    invoke-virtual {v0, p3}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    .line 4942
    :cond_1
    return-void
.end method

.method public startTransition(Landroid/animation/LayoutTransition;Landroid/view/ViewGroup;Landroid/view/View;I)V
    .locals 1
    .parameter "transition"
    .parameter "container"
    .parameter "view"
    .parameter "transitionType"

    .prologue
    .line 4927
    const/4 v0, 0x3

    if-ne p4, v0, :cond_0

    .line 4928
    iget-object v0, p0, Landroid/view/ViewGroup$3;->this$0:Landroid/view/ViewGroup;

    invoke-virtual {v0, p3}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    .line 4930
    :cond_0
    return-void
.end method
