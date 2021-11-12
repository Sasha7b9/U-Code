//
// Copyright (c) 2008-2021 the Urho3D project.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#include "../Precompiled.h"

#include "../DebugNew.h"

namespace Urho3D
{

unsigned HashBase::NumBuckets() const
{
    return ptrs_ ? (reinterpret_cast<unsigned*>(ptrs_))[1] : 0;
}

HashNodeBase** HashBase::Ptrs() const
{
    return ptrs_ ? ptrs_ + 2 : nullptr;
}

void HashBase::SetSize(unsigned size)
{
    if (ptrs_) (reinterpret_cast<unsigned*>(ptrs_))[0] = size;
}

unsigned HashBase::Size() const
{
    return ptrs_ ? (reinterpret_cast<unsigned*>(ptrs_))[0] : 0;
}

void HashBase::AllocateBuckets(unsigned size, unsigned numBuckets)
{
    delete[] ptrs_;

    auto ptrs = new HashNodeBase* [numBuckets + 2];
    auto* data = reinterpret_cast<unsigned*>(ptrs);
    data[0] = size;
    data[1] = numBuckets;
    ptrs_ = ptrs;

    ResetPtrs();
}

void HashBase::ResetPtrs()
{
    // Reset bucket pointers
    if (!ptrs_)
        return;

    unsigned numBuckets = NumBuckets();
    HashNodeBase** ptrs = Ptrs();
    for (unsigned i = 0; i < numBuckets; ++i)
        ptrs[i] = nullptr;
}

}
